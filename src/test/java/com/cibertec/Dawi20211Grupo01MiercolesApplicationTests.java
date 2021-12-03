package com.cibertec;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import com.cibertec.entidad.Rol;
import com.cibertec.entidad.Ubigeo;
import com.cibertec.entidad.Usuario;
import com.cibertec.entidad.UsuarioHasRol;
import com.cibertec.entidad.UsuarioHasRolPK;
import com.cibertec.repositorio.RolRepositorio;
import com.cibertec.repositorio.UbigeoRepositorio;

import org.junit.runner.RunWith;
import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import com.cibertec.servicio.UsuarioServicio;

@RunWith(SpringRunner.class)
@SpringBootTest
class Dawi20211Grupo01MiercolesApplicationTests {

	@Autowired
	private UsuarioServicio usuarioService;

	@Autowired
	private BCryptPasswordEncoder encoder;

	@Autowired
	private UbigeoRepositorio ubigeoRepositorio;

	@Autowired
	private RolRepositorio rolRepositorio;

	@Test
	void contextLoads() {

		// 1 crear el usuario tb usuario
		Usuario bean = new Usuario();
		// bean.setIdUsuario(2);
		bean.setLogin("kamaly");
		bean.setPassword(encoder.encode("kamaly"));
		bean.setApellidos("Zapana Lorenzo");
		bean.setDireccion("Villa residencial MZb lt 8");
		bean.setDni("71306952");
		bean.setNombres("Kamaly");
		bean.setFechaRegistro(new Date());
		bean.setEstado(1);

		Optional<Ubigeo> u = ubigeoRepositorio.findById(5115);
		bean.setUbigeo(u.get());

		// 2 insertar la relacion tb usuario has rol
		UsuarioHasRol usr = new UsuarioHasRol();
		usr.setUsuario(bean);
		// save usuario
		usuarioService.save(bean);

		// inicia la insercion a has rol
		List<Rol> r = rolRepositorio.findByIdRol(1);
		UsuarioHasRolPK usurpk = new UsuarioHasRolPK();
		usr.setRol(r.get(0));
		usurpk.setIdRol(r.get(0).getIdRol());
		usurpk.setIdUsuario(bean.getIdUsuario());

		usr.setUsuarioHasRolPk(usurpk);

		System.out.println("-->>>INICIA INSERT saveHasRol  >>" + bean.toString());
		// save tb usuario_has_rol
		usuarioService.saveHasRol(usr);

	}

}
