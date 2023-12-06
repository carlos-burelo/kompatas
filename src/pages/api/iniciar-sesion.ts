import { DB } from "src/db";

export async function POST(_, request: Request) {
  try {
    const { correo, contrasena } = await request.json();
    const usuario = await DB.verificarUsuario(correo, contrasena);
    if (usuario.toString() === ''){
      return new Response(JSON.stringify({ error: 'Usuario o contraseña incorrectos' }), { status: 401 });
    }

    // se guardara el usuario en una cookie
    
    const userObjStr = JSON.stringify(usuario[0]);
    const cookie = `usuario=${userObjStr}; Path=/; HttpOnly;`;
    const headers = { "Set-Cookie": cookie };

    return new Response(JSON.stringify(usuario), { status: 200, headers });
    
  } catch (error) {
		console.log(error);
    return new Response(JSON.stringify({ error: 'Error en el servidor' }), { status: 500 });
  }
}