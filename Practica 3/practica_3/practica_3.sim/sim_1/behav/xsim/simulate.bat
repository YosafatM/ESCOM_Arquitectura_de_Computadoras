@echo off
REM ****************************************************************************
REM Vivado (TM) v2018.3 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Sat Mar 27 16:33:38 -0600 2021
REM SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
REM
REM Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
call xsim t_sum_res_4bits_behav -key {Behavioral:sim_1:Functional:t_sum_res_4bits} -tclbatch t_sum_res_4bits.tcl -view C:/Users/yosaf/Desktop/Sexto/Arquitectura/Practica 3/practica_3/t_sum_res_4bits_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0