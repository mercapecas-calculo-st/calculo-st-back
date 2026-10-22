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
