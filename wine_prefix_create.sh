#!/bin/bash

#имя префикса
prefix_name=".wine_PostgreSQL_Client"

#создание и настройка префикса
prefix_path=~/${prefix_name}

env WINEARCH=win64 WINEPREFIX="${prefix_path}" winecfg

WINEPREFIX="${prefix_path}" winetricks corefonts
WINEPREFIX="${prefix_path}" winetricks --force dotnet20
WINEPREFIX="${prefix_path}" winetricks --force dotnet48

env WINEARCH=win64 WINEPREFIX="${prefix_path}" winecfg -v win10

