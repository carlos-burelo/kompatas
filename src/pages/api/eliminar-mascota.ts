export async function DELETE(params, request: Request) {
	const data = await request.json()
	console.log('DATOS DESDE EL SERVIDOR: ',data)
	return new Response(JSON.stringify({ ok: true }), {
		status: 200,
		headers: {
			"Content-Type": "application/json",
		},
	})
}