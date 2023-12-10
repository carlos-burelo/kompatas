import { DB } from "src/db";

export async function PUT(params, request: Request) {
  try {
    const { id } = await request.json();
    console.log(id);
    await DB.aprobarSolicitud(id);
    return new Response(JSON.stringify({ status: "success"}), { status: 200 });
  } catch (error) {
    console.log(error);
    return new Response(JSON.stringify({ error: 'Error en el servidor' }), { status: 500 });
  }
}

export async function DELETE(params, request: Request) {
  try {
    const { id } = await request.json();
    console.log(id);
    await DB.rechazarSolicitud(id);
    return new Response(JSON.stringify({ status: "success"}), { status: 200 });
  } catch (error) {
    console.log(error);
    return new Response(JSON.stringify({ error: 'Error en el servidor' }), { status: 500 });
  }
}