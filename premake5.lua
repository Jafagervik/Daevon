
workspace "Daevon"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Daevon"
    location "Daevon"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/vendor/spdlog/include"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

    defines
    {
        "DV_PLATFORM_WINDOWS",
        "DV_BUILD_DLL"
    }

    postbuildcommands
    {
        ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
    }

    filter "configurations:Debug"
        defines "DV_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "DV_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "DV_DIST"
        optimize "On"


        
project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

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
        "Daevon/src"
    }

    links
    {
        "Daevon"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

    defines
    {
        "DV_PLATFORM_WINDOWS"
    }

    filter "configurations:Debug"
        defines "DV_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "DV_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "DV_DIST"
        optimize "On"