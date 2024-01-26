# docker images managements
* py37_cpu_airflow243_slim
   * airflow2.4.3:slim based on debian 11
* py37_cuda_11_2_airflow243_slim
   * airflow2.4.3:slim with debian 11 which is NOT compatible with cuda 11.2 on official NVIDIA driver ❌
* py37_cuda_12_2_airflow243_slim
   * airflow2.4.3:slim with debian 11 is supported by [CUDA 12](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Debian&target_version=11) ✅
* py38_cpu_vits
   * add text-to-speech project neccessory packages.
* py38_cuda_vits
   * add text-to-speech project neccessory packages based on nvidia/cuda:11.4.3-cudnn8-runtime-ubuntu18.04.
   * cuda gpu support ✅
* py39_cuda_vits
   * add cuda11.4.3 gpu speedup on Python3.9.5
* py311_cuda_vits
   * add cuda11.4.3 gpu speedup on Python3.11.5
