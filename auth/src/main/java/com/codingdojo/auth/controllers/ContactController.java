package com.codingdojo.auth.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.auth.models.Contact;

@Controller
public class ContactController {

    @Autowired
    private JavaMailSender mailSender;

    @GetMapping("/contact")
    public String showContactForm(Model model) {
        model.addAttribute("contactForm", new Contact());
        return "contact.jsp";
    }

    @PostMapping("/contact")
    public String submitContact(@ModelAttribute("contactForm") Contact contactForm, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "contact.jsp";
        }

        try {
            SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setFrom(contactForm.getEmail());
            mailMessage.setTo("truebites172@gmail.com");
            mailMessage.setSubject(contactForm.getSubject());
            mailMessage.setText("Name: " + contactForm.getName() + "\n\nMessage:\n" + contactForm.getMessage());

            mailSender.send(mailMessage);
            model.addAttribute("successMessage", "Your message has been sent successfully!");
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Error sending message: " + e.getMessage());
        }

        return "contact.jsp";
    }
}
