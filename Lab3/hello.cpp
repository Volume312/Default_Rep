#include <stdio.h>
#include <thread>

int main(){
  printf("Alibek's remote machine:\n");
  auto numCores = std::thread::hardware_concurrency();

  printf("num CPU cores on this machine: %d\n", numCores);

  return 0;
}
