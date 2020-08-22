workspace "MyProject"
	architecture "x64"
	configurations { "Debug", "Release" }
	startproject "MyProject"

	flags
	{
		"MultiProcessorCompile"
	}

build_dir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}

group "Core/"
project "MyProject"
	location "MyProject"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	
	targetdir ("bin/" .. build_dir .. "/%{prj.name}")
	objdir ("bin-int/" .. build_dir .. "/%{prj.name}")

	pchheader "pch.h"
	pchsource "MyProject/src/pch.cpp"

	files { "%{prj.name}/src/**.h", "%{prj.name}/src/**.hpp", 
			"%{prj.name}/src/**.c", "%{prj.name}/src/**.cpp" }

	includedirs { "%{prj.name}/src", "%{prj.name}/vendor/spdlog/include" }

	filter "configurations:Debug"
		defines { "_CONFIG_DEBUG" }
		symbols "On"

	filter "configurations:Release"
		defines { "_CONFIG_RELEASE" }
		optimize "On"

	filter "system:windows"
		systemversion "latest"
		defines { "_SYSTEM_WINDOWS" }

	filter "system:linux"
		defines { "_SYSTEM_LINUX" }

	filter "system:macosx"
		defines { "_SYSTEM_MACOSX" }
