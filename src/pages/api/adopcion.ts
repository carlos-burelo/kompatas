import { DB } from "src/db"

export async function POST(params, request: Request) {
	const data = await request.json()
	data.tiene_casa_propia = data.tiene_casa_propia == 'on' ? true :false
	data.posee_espacio_libre = data.posee_espacio_libre == 'on' ? true : false
	DB.insertarFormulario(data)
	DB.mascotaEnProceso(data.id_mascota, data.id_usuario)
	return new Response(JSON.stringify({ message: 'ok' }))
}