import { DB } from "src/db";

export async function DELETE(params, request: Request) {
	try {
		const { id } = await request.json();
		await DB.eliminarMascota(id);
		return new Response(JSON.stringify({ ok: true }), { status: 200 });
	} catch (error) {
		return new Response(JSON.stringify({ ok: false, error }), { status: 500 });
	}
}

export async function POST(params, request: Request) {
	try {
		const mascota = await request.json();
		await DB.insertarMascota(mascota);
		return new Response(JSON.stringify({ ok: true }), { status: 200 });
	} catch (error) {
		return new Response(JSON.stringify({ ok: false, error }), { status: 500 });
	}
}