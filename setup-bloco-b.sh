#!/usr/bin/env bash
# =====================================================================
# setup-bloco-c.sh
# Gera os 2 arquivos do Bloco C (Classe de Entrada e Testes):
#   7. backend/src/main/java/br/com/mercapecas/calculost/CalculoStApplication.java
#   8. backend/src/test/java/br/com/mercapecas/calculost/CalculoStApplicationTests.java
#
# Roda na RAIZ do projeto. Idempotente: sobrescreve os arquivos.
# =====================================================================
set -euo pipefail

# --- Sanity check ----------------------------------------------------
if [[ ! -f "docker-compose.yml" || ! -d "db/init" ]]; then
  echo "ERRO: rode este script na raiz do projeto."
  exit 1
fi

if [[ ! -f "backend/pom.xml" || ! -f "backend/src/main/resources/application.yml" ]]; then
  echo "ERRO: Blocos A e/ou B ainda não foram rodados."
  exit 1
fi

# --- Criar estrutura de diretórios -----------------------------------
MAIN_DIR="backend/src/main/java/br/com/mercapecas/calculost"
TEST_DIR="backend/src/test/java/br/com/mercapecas/calculost"

echo ">>> Criando diretórios..."
mkdir -p "$MAIN_DIR"
mkdir -p "$TEST_DIR"

# =====================================================================
# Arquivo 7: CalculoStApplication.java
# =====================================================================
echo ">>> [7/2] $MAIN_DIR/CalculoStApplication.java"
cat > "$MAIN_DIR/CalculoStApplication.java" <<'EOF'
package br.com.mercapecas.calculost;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CalculoStApplication {

    public static void main(String[] args) {
        SpringApplication.run(CalculoStApplication.class, args);
    }
}
EOF

# =====================================================================
# Arquivo 8: CalculoStApplicationTests.java
# =====================================================================
echo ">>> [8/2] $TEST_DIR/CalculoStApplicationTests.java"
cat > "$TEST_DIR/CalculoStApplicationTests.java" <<'EOF'
package br.com.mercapecas.calculost;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class CalculoStApplicationTests {

    @Test
    void contextLoads() {
        // Se o contexto do Spring subir sem exceção, o teste passa.
        // Este teste valida a conexão com o banco (via Flyway) e a
        // configuração do Hibernate (ddl-auto: validate).
    }
}
EOF

# =====================================================================
# Validações automáticas (C1–C4)
# =====================================================================
echo
echo "============================================================"
echo "  Bloco C gerado. Rodando validações..."
echo "============================================================"
echo

PASS=0
FAIL=0

check() {
  local desc="$1"
  local cmd="$2"
  if eval "$cmd" > /dev/null 2>&1; then
    echo "  [OK]   $desc"
    PASS=$((PASS+1))
  else
    echo "  [FAIL] $desc"
    FAIL=$((FAIL+1))
  fi
}

check "C1  CalculoStApplication.java existe" \
  "test -f '$MAIN_DIR/CalculoStApplication.java'"

check "C2  Pacote correto (br.com.mercapecas.calculost)" \
  "grep -q '^package br.com.mercapecas.calculost;' '$MAIN_DIR/CalculoStApplication.java'"

check "C3  Anotação @SpringBootApplication presente" \
  "grep -q '@SpringBootApplication' '$MAIN_DIR/CalculoStApplication.java'"

check "C4  CalculoStApplicationTests.java existe e usa @SpringBootTest" \
  "test -f '$TEST_DIR/CalculoStApplicationTests.java' && grep -q '@SpringBootTest' '$TEST_DIR/CalculoStApplicationTests.java'"

echo
echo "  Resultado: $PASS OK, $FAIL FAIL"
echo
echo "============================================================"
echo "  Próximos passos:"
echo "============================================================"
echo
echo "  Neste ponto, o código Java base está pronto, mas o projeto"
echo "  ainda NÃO COMPILA porque faltam as entidades JPA e o schema"
echo "  do banco (Bloco D)."
echo
echo "  Você pode inspecionar a estrutura gerada:"
echo "     find backend/src -name '*.java'"
echo