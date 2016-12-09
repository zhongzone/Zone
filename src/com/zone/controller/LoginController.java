package com.zone.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Random;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.zone.entity.User;
import com.zone.service.UserService;
import com.zone.util.MD5;

@Controller
public class LoginController implements HandlerInterceptor
{

	@Resource
	private UserService userService;
	
	/**
	 * 退出登录
	 * @param request
	 * @return 重定向原页面，相当于刷新
	 */
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request)
	{
		String returnUrl = request.getParameter("returnUrl");
		HttpSession session = request.getSession();
		session.removeAttribute("username");
		session.removeAttribute("password");
		return new ModelAndView("redirect:"+returnUrl);
	}
	
	@RequestMapping("/login2")
	public String login2(){
		return "login2";
	}
	
	
	/**
	 * 检查验证码/用户名/密码是否正确
	 * @param request
	 * @return
	 */
	@RequestMapping("/validate")
	public ModelAndView validate(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		String rand = (String) session.getAttribute("rand");
		String input = request.getParameter("rand");
		
		 // 登陆之前的页面，登陆完毕要返回该页面
		String returnUrl = null;
		if(null != session.getAttribute("returnUrl"))  //优先选取session中保存的returnUrl
		{
			returnUrl = (String) session.getAttribute("returnUrl");
		}
		else
		{
			returnUrl = request.getParameter("returnUrl");
			session.setAttribute("returnUrl", returnUrl); //把returnUrl放入session，防止第二次登录失败导致returnUrl变为登录页面
		}
		
		String username = request.getParameter("username");
		String password = MD5.MD5(request.getParameter("password"));
		String message = null; //错误信息
		User user = userService.findUser(username);
		System.out.println("--------------------------"+rand+"  "+input);
		if (rand.equals(input))	//验证用户名、密码和验证码
		{
			if(user != null)
			{
				if(password.equals(user.getPassword()))
				{
					session.setAttribute("username", username);
					session.setAttribute("password", password);
					return new ModelAndView("redirect:"+returnUrl);
				}
				else
				{
					message = "密码错误";
				}
			}
			else
			{
				message = "用户名不存在";
			}
		}
		else
		{
			message = "验证码错误";
		}
		
		
		//登录失败
			HashMap<String, Object> model = new HashMap<String, Object>();
			model.put("refer", request.getHeader("referer"));
			model.put("message", message);
			ModelAndView mv = new ModelAndView("login2",model);
			return mv;
	}

	Color getRandColor(int fc, int bc)
	{
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}

	/**
	 * 获取验证码图像
	 * @param request
	 * @param response
	 */
	@RequestMapping("/image")
	public void drawImage(HttpServletRequest request,
			HttpServletResponse response)
	{
//		out.clear();//这句针对resin服务器，如果是tomacat可以不要这句
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		int width = 60, height = 20;
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		Random random = new Random();
		g.setColor(getRandColor(200, 250));
		g.fillRect(0, 0, width, height);
		g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		g.setColor(getRandColor(160, 200));
		for (int i = 0; i < 155; i++)
		{
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
			g.drawLine(x, y, x + xl, y + yl);
		}
		String sRand = "";
		for (int i = 0; i < 4; i++)
		{
			String rand = String.valueOf(random.nextInt(10));
			sRand += rand;
			g.setColor(new Color(20 + random.nextInt(110), 20 + random
					.nextInt(110), 20 + random.nextInt(110)));
			g.drawString(rand, 13 * i + 6, 16);
		}
		// 将认证码存入SESSION
		request.getSession().setAttribute("rand", sRand);
		g.dispose();

		try
		{
			ImageIO.write(image, "JPEG", response.getOutputStream());
		} catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		HttpSession session = request.getSession();
		String fromUrl = request.getHeader("Referer");
		if(session.getAttribute("username") == null){
			response.sendRedirect("login2?refer="+fromUrl);
			return false;
		}
		return true;
	}
}
