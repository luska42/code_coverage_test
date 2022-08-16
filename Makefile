#================= AVISOS
# Coloque esse arquivo Makefile e o código fonte main.c ISOLADOS EM UMA PASTA;
# O alvo "clean" irá DELETAR TUDO que não seja os dois acima.
#
# Instale o "lcov" no seu sistema, caso já não esteja;
# Execute: "lcov --version" em um terminal para verificar se ele está instalado;
# Caso não esteja: "sudo apt-get install lcov" (para Linux Ubuntu)

#================= Variáveis de ambiente
SHELL := /bin/bash

SOURCE_DIR = $HOME

#================= Alvos
all: clean coverage

compile:
	@echo -e "\n\nMAKE ... compile"
	gcc main.c

coverage:
	@echo -e "\n\nMAKE ... coverage"
	gcc -Wall -fprofile-arcs -ftest-coverage main.c
	@echo -e "\n\n... program output ..."
	@./a.out
	@echo -e "\n\n... code coverage ..."
	@gcov main.c
	@cat main.c.gcov
	@echo -e "\n\n... lcov run ..."
	@lcov --directory . --capture --output-file main_coverage.info
	@genhtml main_coverage.info
	# firefox index.html

clean:
	@echo -e "\n\nMAKE ... clean"
	@find . -type f,d -not \( -name 'Makefile' -or -name 'main.c' \) -delete