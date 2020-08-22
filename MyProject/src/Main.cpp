#include "pch.h"

#include "Log/Log.h"




int main(int argc, char** argv)
{
    App::Log::Init();


    for (size_t i = 0; i < 1623; i++)
    {
        _CORE_INFO("Hello World!");

    }

    std::cin.get();
    return 0;
}