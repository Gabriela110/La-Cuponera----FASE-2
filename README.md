# La-Cuponera---FASE-2
Fase 2 - Lenguajes interpretados al servidor 

Modulo para Administrador: 
- login_admin.php → inicio de sesión del administrador.
- Si el login es correcto, redirige a admin.php.
- Dentro del panel admin.php, hay varias opciones:
       ->  ver_registro.php: permite aprobar o rechazar empresas que se han registrado.
       ->  registro_admin.php: formulario para registrar nuevos administradores dentro del sistema.
       


Modulo para Usuarios (Clientes y Empresas): 
- index.php → página principal del sitio 
- Desde la pantalla de inicio, se puede:
    -> Iniciar sesión (login.php)
    -> Registrarse como empresa (registro_empresas.php)
    -> Registrarse como cliente (registro_clientes.php)
  
        NOTA: 
        ** En el registro de empresas, al completarse correctamente,
           se muestra un mensaje indicando que la cuenta está en espera de aprobación por el administrador
     -> Una vez fue aprobada por el administrador puede Iniciar sesion y lo redirigirá al panel_empresa.php, donde hay un formulario para colocar todos los datos de la oferta,
        tambien dentro del panel_empresa.php se encuentra un apartado llamado "Mis Cupones" donde se muestra en forma de tabla los cupones que han sido agregados.
       
  
  - Desde login.php, el usuario puede:
     -> Volver al inicio (index.php)
     -> Iniciar sesion con su usuario y contraseña (sea empresa o cliente)
