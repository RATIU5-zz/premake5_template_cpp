#include "pch.h"

#include "Log/Log.h"


int main(int argc, char** argv)
{

    std::cout << "Hello, World!" << std::endl;
    App::Log::Init();
    //App Loop
    while true() {
      for (size_t i = 0; i < 1623; i++)
      {
          _CORE_INFO("Hello World!");

      }
    }
}
