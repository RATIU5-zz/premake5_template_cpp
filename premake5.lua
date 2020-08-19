workspace "MyProject"
	architecture "x86_64"
	configurations { "Debug", "Release" }

build_dir = "%{cfg.config}-%{cfg.platform}-%{cfg.architecture}"

project "MyProject"
	location "MyProject"
	language "C++"
	kind "ConsoleApp"
	targetdir ("bin/" .. build_dir .. "/%{prj.name}")
	objdir ("bin/" .. build_dir .. "/%{prj.name}")

	files { "**.h", "**.hpp", "**.c", "**.cpp" }

	includedirs { "%{prj.name}/src" }

	filter "configurations:Debug"
		defines { "_CONFIG_DEBUG" }
		symbols "On"

	filter "configurations:Release"
		defines { "_CONFIG_RELEASE" }
		optimize "On"

	filter "system:windows"
		defines { "_SYSTEM_WINDOWS" }

	filter "system:linux"
		defines { "_SYSTEM_LINUX" }

	filter "system:macosx"
		defines { "_SYSTEM_MACOSX" }
