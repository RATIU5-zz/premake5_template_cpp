workspace "MyProject"
    architecture "x86_64"
	startproject "MyProject"
    configurations { "Debug", "Release" }

    builddir "%{cfg.config}-%{cfg.platform}-%{cfg.architecture}"

project "MyProject"
    location "MyProject"
    language "C++"
    kind "ConsoleApp"
    targetdir "bin/" .. builddir .. "/%{prj.name}"
    objdir "bin/" .. builddir .. "/%{prj.name}"

    files { "**.h", "**.hpp", "**.c", "**.cpp" }

    includedirs { "%{prj.name}/src" }

    filter "configuration:Debug"
        defines { "_CONFIG_DEBUG" }
        symbols "On"

    filter "configuration:Release"
        defines { "_CONFIG_RELEASE" }
        optimize "On"

    filter "system:windows"
        defines { "_SYSTEM_WINDOWS" }

    filter "system:linux"
        defines { "_SYSTEM_LINUX" }

    filter "system:macosx"
        defines { "_SYSTEM_MACOSX" }
