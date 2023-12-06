export default async function fetcher(url: string, payload: object){
    const response = await fetch(url, {
        method: 'POST',
        body: JSON.stringify(payload),
        headers: {
            'Content-Type': 'application/json'
        }
    });

    return {
        data: await response.json(),
        status: response.status
    }
}