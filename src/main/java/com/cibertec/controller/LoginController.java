package com.cibertec.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cibertec.entidad.Opcion;
import com.cibertec.entidad.Rol;
import com.cibertec.entidad.Usuario;
import com.cibertec.servicio.UsuarioServicio;

@Controller
public class LoginController {

	@Autowired
	private UsuarioServicio servicio;



	@RequestMapping("/login")
	public String login(Usuario user, HttpSession session, HttpServletRequest request) {
		Usuario usuario = servicio.login(user);
		if (usuario == null) {
			request.setAttribute("mensaje", "El usuario no existe");
			return "intranetLogin";
		} else {
			List<Opcion> menus = servicio.traerEnlacesDeUsuario(usuario.getIdUsuario());
			List<Rol> roles = servicio.traerRolesDeUsuario(usuario.getIdUsuario());

			session.setAttribute("objUsuario", usuario);
			session.setAttribute("objMenus", menus);
			session.setAttribute("objRoles", roles);

			return "intranetHome";
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session.invalidate();

		response.setHeader("Cache-control", "no-cache");
		response.setHeader("Expires", "0");
		response.setHeader("Pragma", "no-cache");

		request.setAttribute("mensaje", "El usuario salió de sesión");
		return "intranetLogin";

	}

}
