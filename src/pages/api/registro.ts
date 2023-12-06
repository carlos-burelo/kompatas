import { DB } from "src/db";

export async function POST(_, request: Request) {
  try {
    const { nombre, apellido_1, apellido_2, correo, contrasena } = await request.json();
    const existe_usuario = await DB.verificarUsuario(correo, contrasena);

    if (existe_usuario.toString() !== ''){
      return new Response(JSON.stringify({ error: 'Usuario ya existe' }), { status: 401 });
    }

    const usuario = await DB.insertarUsuario({ nombre, apellido_1, apellido_2, correo, contrasena, es_admin: false });

    return new Response(JSON.stringify(usuario), { status: 200 });
    
  } catch (error) {
		console.log(error);
    return new Response(JSON.stringify({ error: 'Error en el servidor' }), { status: 500 });
  }
}