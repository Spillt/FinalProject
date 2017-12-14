package com.godsky.findlove.user.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.godsky.findlove.user.model.service.MailService;
import com.godsky.findlove.user.model.service.UserService;
import com.godsky.findlove.user.model.vo.User;

@Controller
public class MailController {
	@Autowired
    private UserService userService;
    private MailService mailService;
 
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
 
    public void setMailService(MailService mailService) {
        this.mailService = mailService;
    }
 
    /*// 회원가입 이메일 인증
    @RequestMapping(value = "/sendMail/auth", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public boolean sendMailAuth(HttpSession session, @RequestParam String email) {
        int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
        String joinCode = String.valueOf(ran);
        session.setAttribute("joinCode", joinCode);
 
        String subject = "회원가입 인증 코드 발급 안내 입니다.";
        StringBuilder sb = new StringBuilder();
        sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");
        return mailService.send(subject, sb.toString(), "아이디@gmail.com", email, null);
    }*/
 
    // 아이디 찾기
    @RequestMapping(value = "findId.do", method = RequestMethod.POST)
    public String sendMailId(HttpSession session, @RequestParam String userName, @RequestParam String email, RedirectAttributes ra) {
    	System.out.println("aa");
    	User user = userService.findAccount(email);
        if (user != null) {
        	if (!user.getUserName().equals(userName)) {
                ra.addFlashAttribute("resultMsg", "입력하신 이메일과 이름이 가입된 회원 정보와 일치하지 않습니다.");
                return "user/findidpwd";
            }
            String subject = "아이디 찾기 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 아이디는 " + user.getUserId() + " 입니다.");
            mailService.send(subject, sb.toString(), "아이디@gmail.com", email, null);
            ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 해당 이메일로 가입된 아이디를 발송 하였습니다.");
        } else {
            ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
        }
        return "user/findidpwd";
    }
 
    // 비밀번호 찾기
    @RequestMapping(value = "findPwd.do", method = RequestMethod.POST)
    public String sendMailPassword(HttpSession session, @RequestParam String userId, @RequestParam String email, RedirectAttributes ra) {
        System.out.println("aa");
    	User user = userService.findAccount(email);
        if (user != null) {
            if (!user.getUserId().equals(userId)) {
                ra.addFlashAttribute("resultMsg", "입력하신 이메일과 아이디가 가입된 회원 정보와 일치하지 않습니다.");
                return "user/findidpwd";
            }
            int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
            String password = String.valueOf(ran);
            userService.updateInfo(user.getUserId(), "password", password); // 해당 유저의 DB정보 변경
 
            String subject = "임시 비밀번호 발급 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
            mailService.send(subject, sb.toString(), "아이디@gmail.com", email, null);
            ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
        } else {
            ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
        }
        return "user/findidpwd";
    }
}

