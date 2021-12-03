package com.cibertec.security;

import java.util.Collection;

import java.util.HashSet;
import java.util.Set;

import com.cibertec.entidad.Usuario;
import com.cibertec.servicio.UsuarioServicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserDetailsService {

    @Autowired
	private UsuarioServicio usuarioService;

    @Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserDetails userDet = null;

		Usuario bean;
		bean = usuarioService.Singin(username);
		//
		Set<GrantedAuthority> rol = new HashSet<GrantedAuthority>();
		// adicionar a rol

		rol.add(new SimpleGrantedAuthority("ADMIN"));
		//rol.add(new SimpleGrantedAuthority(bean.getRol().getDescripcion()));
		// crear objeto userDet
		userDet = new User(username, bean.getPassword(), rol);

		return userDet;
	}
}
