/// <reference types="astro/client" />


interface Usuario {
  id_usuario?: number;
  nombre: string;
  apellido_1: string;
  apellido_2: string;
  correo: string;
  contrasena: string;
  es_admin: boolean;
}

interface Mascota {
  id_mascota?: number;
  nombre: string;
  raza: string;
  color: string;
  tamaño: string;
  url_imagen: string;
}

interface Adopcion {
  id_adopcion?: number;
  id_mascota: number;
  id_usuario: number;
  fecha: string; // En TypeScript, podrías usar un tipo de fecha específico si estás utilizando bibliotecas para manejar fechas.
  estado_adopcion: string;
}

interface Formulario {
  id_formulario?: number;
  nombre: string;
  direccion: string;
  telefono: string;
  empleo: string;
  tiene_casa_propia: boolean;
  ingresos_mensuales: number;
  motivo_adopcion: string;
  posee_espacio_libre: boolean;
  id_usuario: number;
}
