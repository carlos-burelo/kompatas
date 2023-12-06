import { DB } from "src/db";

export async function POST(_, request: Request) {
  try {
    const { correo, contrasena } = await request.json();
    const usuario = await DB.verificarUsuario(correo, contrasena);

  

    if (usuario.toString() === ''){
      return new Response(JSON.stringify({ error: 'Usuario o contraseña incorrectos' }), { status: 401 });
    }

    if (!usuario[0].es_admin){
      return new Response(JSON.stringify({ error: 'Usuario no es administrador' }), { status: 401 });
    }

    return new Response(JSON.stringify(usuario), { status: 200 });
  } catch (error) {
		console.log(error);
    return new Response(JSON.stringify({ error: 'Error en el servidor' }), { status: 500 });
  }
}