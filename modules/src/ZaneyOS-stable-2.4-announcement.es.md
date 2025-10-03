# ¡ZaneyOS v2.4 ya está aquí! 🚀

Nos complace anunciar ZaneyOS v2.4: una versión centrada en mejorar la experiencia de escritorio, simplificar la personalización y fortalecer las herramientas.

Destacados
- Nuevo gestor de inicio predeterminado: SDDM con un greeter tematizado para una experiencia de inicio pulida
- Conmutadores de funciones en las variables del host: Activa o desactiva componentes fácilmente en `hosts/<tu-host>/variables.nix`
  - Terminales (kitty, wezterm, ghostty, alacritty)
  - Perfiles de Waybar y animaciones
  - Thunar, impresión, NFS, elección de navegador, etc.
  - Selección del gestor de inicio mediante `displayManager`
- zcli actualizado: mejores flujos y utilidades (incluye bootstrap para Doom Emacs)
- Doom Emacs: interruptor de primera clase + ruta de instalación más sencilla (`zcli doom install` tras habilitarlo)
- Estructura de configuración mejorada: separación más clara, actualizaciones más seguras y valores por defecto más coherentes
- Mejoras en Fastfetch: muestra la versión de ZaneyOS de forma dinámica
- Documentación: ha empezado el esfuerzo de traducción al español (¡gracias!)

Enlaces
- GitLab: https://gitlab.com/zaney/zaneyos
- README: https://gitlab.com/zaney/zaneyos/-/blob/stable-2.4/README.md



⚠️ NOTAS IMPORTANTES DE ACTUALIZACIÓN (LEE ESTO)
- El script de actualización SOLO está pensado para pasar de v2.3 → v2.4.
- Si tienes una v2.3 muy modificada, NO uses el script de actualización. Considera una instalación limpia de v2.4 y migra tus cambios manualmente.
- Copias de seguridad: Los scripts de instalación y actualización hacen copia de tu `~/zaneyos` actual, pero recomendamos encarecidamente que hagas tu propia copia de seguridad adicional.
- Reversión: Hay un script de reversión (por ejemplo, `./revert-to-2.3.sh`) si necesitas volver atrás usando tu copia de seguridad.
- Alcance: No podemos probar todas las combinaciones y personalizaciones posibles al actualizar de v2.3 a v2.4. Procede con cuidado y revisa las diferencias.

Nota sobre la rama
- v2.4 está publicada en la rama `stable-2.4`.

¡Gracias por usar ZaneyOS! 🎉

