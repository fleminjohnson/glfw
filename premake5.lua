project "GLFW"
  kind "StaticLib"
  language "C"
  staticruntime "on"

    targetdir ("bin/" .. outputdir .. "%/{prj.name}")
    objdir("bin-int/" .. outputdir .. "%/{prj.name}")

  files 
  {
    "include/GLFW/glfw3.h",
    "include/GLFW/glfw3native.h",
    "src/glfw_config.h",
    "src/context.c",
    "src/init.c",
    "src/input.c",
    "src/monitor.c",
    "src/window.c",
    "src/vulkan.c"
  }

  filter "system:windows"
  --buildoptions {"-std=c11","lgdi32"}
  systemversion "latest"

  files
  {
    "src/win32_init.c",
    "src/win32_joystick.c",
    "src/win32_monitor.c",
    "src/win32_time.c",
    "src/win32_thread.c",
    "src/win32_window.c",
    "src/wgl_context.c",
    "src/egl_context.c",
    "src/osmesa_context.c"
  }

  defines
  {
    "_GLFW_WIN32",
    "_CRT_SECURE_NO_WARNINGS"
  }

  --filter {"system:windows", "configurations:Release"}
  --buildoptions "/MT"

  filter "configurations:Debug"
    --defines "TB_DEBUG"
    runtime "Debug"
    --buildoptions "/MDd"
    symbols "on"

  filter "configurations:Release"
    --defines "TB_RELEASE"
    runtime "Release"
    --buildoptions "/MD"
    optimize "on"

