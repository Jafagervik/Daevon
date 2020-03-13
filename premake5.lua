workspace "Daevon"
	architecture "x86_64"
	startproject "Sandbox"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}
	
	flags
	{
		"MultiProcessorCompile"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Daevon/vendor/GLFW/include"
IncludeDir["Glad"] = "Daevon/vendor/Glad/include"
IncludeDir["ImGui"] = "Daevon/vendor/imgui"
IncludeDir["glm"] = "Daevon/vendor/glm"
IncludeDir["stb_image"] = "Daevon/vendor/stb_image"

group "Dependencies"
	include "Daevon/vendor/GLFW"
	include "Daevon/vendor/Glad"
	include "Daevon/vendor/imgui"

group ""

project "Daevon"
	location "Daevon"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "dvpch.h"
	pchsource "Daevon/src/dvpch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/vendor/stb_image/**.h",
		"%{prj.name}/vendor/stb_image/**.cpp",
		"%{prj.name}/vendor/glm/glm/**.hpp",
		"%{prj.name}/vendor/glm/glm/**.inl",
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.glm}",
		"%{IncludeDir.stb_image}"
	}

	links 
	{ 
		"GLFW",
		"Glad",
		"ImGui",
		"opengl32.lib"
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
			"DV_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}

	filter "configurations:Debug"
		defines "DV_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "DV_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "DV_DIST"
		runtime "Release"
		optimize "on"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Daevon/vendor/spdlog/include",
		"Daevon/src",
		"Daevon/vendor",
		"%{IncludeDir.glm}"
	}

	links
	{
		"Daevon"
	}

	filter "system:windows"
		systemversion "latest"
		
	filter "configurations:Debug"
		defines "DV_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "DV_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "DV_DIST"
		runtime "Release"
		optimize "on"