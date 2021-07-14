project "GLFW"
  kind "StaticLib"
  language "C"

    targetdir ("bin/" .. outputdir .. "%/{prj.name}")
objdir("bin-int/" .. outputdir .. "%/{prj.name}")

files 
{
  "include/GLFW/glfw3.h",
  "include/GLFW/glfw3native.h",
  "Src/glfw_config.h",
  "Src/context.c",
  "Src/init.c",
  "Src/input.c",
  "Src/monitor.c",
  "Src/window.c",
  "Src/vulkan.c"
}

filter "system:windows"
buildoptions {"-std=c11","lgdi32"}
systemversion "latest"
staticruntime "On"

files
{
  "Src/win32_init.c",
  "Src/win32_joystick.c",
  "Src/win32_monitor.c",
  "Src/win32_time.c",
  "Src/win32_thread.c",
  "Src/win32_window.c",
  "Src/wgl_context.c",
  "Src/egl_context.c",
  "Src/osmesa_context.c"
}

defines
{
  "_GLFW_WIN32",
  "_CRT_SECURE_NO_WARNINGS"
}

filter {"system:windows", "configurations:Release"}
buildoptions "/MT"
