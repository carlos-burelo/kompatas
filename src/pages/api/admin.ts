import { DB } from "src/db";

export async function POST(_, request: Request) {
  try {
    const { correo, contrasena } = await request.json();
    const usuario = await DB.verificarUsuario(correo, contrasena);

    if (usuario.toString() === ''){
      return new Response(JSON.stringify({ error: 'Usuario o contraseña incorrectos' }), { status: 401 });
    }

    if (Boolean(usuario[0].es_admin === 0 as any)){
      return new Response(JSON.stringify({ error: 'Usuario no es administrador' }), { status: 401 });
    }

    const userObjStr = JSON.stringify(usuario[0]);
    const cookie = `usuario=${userObjStr}; Path=/; HttpOnly;`;
    const headers = { "Set-Cookie": cookie };
    return new Response(JSON.stringify(usuario), { status: 200, headers });
  } catch (error) {
		console.log(error);
    return new Response(JSON.stringify({ error: 'Error en el servidor' }), { status: 500 });
  }
}