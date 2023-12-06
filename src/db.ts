import { createConnection} from 'mysql2/promise'


export class DB {
  private static connection: any;

  static async connect() {
    if (!this.connection) {
      this.connection = await createConnection({
        user: import.meta.env.DB_USER,
        password: import.meta.env.DB_PASS,
        host: import.meta.env.DB_HOST,
        database: import.meta.env.DB_NAME ,
        port: parseInt(import.meta.env.DB_PORT as string),
      });
    }
    return this.connection;
  }

  static async verificarUsuario(correo: string, contrasena: string) {
    const connection = await this.connect();
    const [resultado] = await connection.execute(
      'SELECT * FROM usuario WHERE correo = ? AND contrasena = ?',
      [correo, contrasena]
    );
    return resultado as Usuario[];
  }

  static async insertarUsuario(usuario: Partial<Usuario>) {
    const connection = await this.connect();
    const [resultado] = await connection.execute(
      'INSERT INTO usuario (nombre, apellido_1, apellido_2, correo, contrasena, es_admin) VALUES (?, ?, ?, ?, ?, ?)',
      [usuario.nombre, usuario.apellido_1, usuario.apellido_2, usuario.correo, usuario.contrasena, usuario.es_admin]
    );
    return resultado;
  }

  static async obtenerUsuarios() {
    const connection = await this.connect();
    const [resultado] = await connection.execute('SELECT * FROM usuario');
    return resultado as Usuario[];
  }

  static async removerUsuario(id: number) {
    const connection = await this.connect();
    const [resultado] = await connection.execute('DELETE FROM usuario WHERE id_usuario = ?', [id]);
    return resultado;
  }

  static async insertarMascota(mascota: Partial<Mascota>) {
    const connection = await this.connect();
    const [resultado] = await connection.execute(
      'INSERT INTO mascota (nombre, raza, color, tamaño, url_imagen) VALUES (?, ?, ?, ?, ?)',
      [mascota.nombre, mascota.raza, mascota.color, mascota.tamaño, mascota.url_imagen]
    );
    return resultado;
  }

  static async obtenerMascotas() {
    const connection = await this.connect();
    const [resultado] = await connection.execute('SELECT * FROM mascota');
    return resultado as Mascota[];
  }

  static async removerMascota(id: number) {
    const connection = await this.connect();
    const [resultado] = await connection.execute('DELETE FROM mascota WHERE id_mascota = ?', [id]);
    return resultado;
  }

  static async insertarAdopcion(adopcion: Partial<Adopcion>) {
    const connection = await this.connect();
    const [resultado] = await connection.execute(
      'INSERT INTO adopcion (id_mascota, id_usuario, fecha, estado_adopcion) VALUES (?, ?, ?, ?)',
      [adopcion.id_mascota, adopcion.id_usuario, adopcion.fecha, adopcion.estado_adopcion]
    );
    return resultado;
  }

  static async obtenerAdopciones() {
    const connection = await this.connect();
    const [resultado] = await connection.execute('SELECT * FROM adopcion');
    return resultado as Adopcion[];
  }

  static async insertarFormulario(formulario: Partial<Formulario>) {
    const connection = await this.connect();
    const [resultado] = await connection.execute(
      'INSERT INTO formulario (nombre, direccion, telefono, empleo, tiene_casa_propia, ingresos_mensuales, motivo_adopcion, posee_espacio_libre, id_usuario) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [
        formulario.nombre,
        formulario.direccion,
        formulario.telefono,
        formulario.empleo,
        formulario.tiene_casa_propia,
        formulario.ingresos_mensuales,
        formulario.motivo_adopcion,
        formulario.posee_espacio_libre,
        formulario.id_usuario,
      ]
    );
    return resultado;
  }

  static async obtenerFormularios() {
    const connection = await this.connect();
    const [resultado] = await connection.execute('SELECT * FROM formulario');
    return resultado as Formulario[];
  }
}