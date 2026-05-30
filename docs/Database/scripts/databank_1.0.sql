CREATE DATABASE IF NOT EXISTS SGC;
USE SGC;

CREATE TABLE usuarios(
	id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,    
    senha VARCHAR(255) NOT NULL,
    perfil  ENUM('ADMIN', 'FUNCIONARIO') NOT NULL,
    
    UNIQUE (username)
);

CREATE TABLE clientes(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
	email VARCHAR(100) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    endereco TEXT NOT NULL,
    
    UNIQUE (cpf)
    
    ##CONSTRAINT ck_clientes_email01 CHECK (email LIKE '[a-z,0-9,_,-]%@[a-z,0-9,_,-]%.[a-z]%'),
    ##CONSTRAINT ck_clientes_email02 CHECK (email NOT LIKE '%[^a-z0-9@._-]%'),
    ##CONSTRAINT ck_clientes_email03 CHECK (email NOT LIKE '%@%@%'),
    ##CONSTRAINT ck_clientes_email04 CHECK (email NOT LIKE '%.@%'), 
    ##CONSTRAINT ck_clientes_email05 CHECK (email NOT LIKE '%..%'),
    
    ##CONSTRAINT ck_clientes_telefone01 CHECK (telefone LIKE '[0,9]'),
    ##CONSTRAINT ck_clientes_telefone02 CHECK (telefone NOT LIKE '%[^0-9]%'
);


CREATE TABLE produtos(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    preco DECIMAL (13, 2) NOT NULL,
    estoque INT NOT NULL,
    estoque_min INT NOT NULL,
    
    CONSTRAINT ck_produtos_preco01 CHECK (preco >= 0),
    CONSTRAINT ck_produtos_estoque01 CHECK (estoque >= 0),
    CONSTRAINT ck_produtos_estoque_min01 CHECK (estoque_min >=0 )
);

CREATE TABLE vendas(
	id INT AUTO_INCREMENT PRIMARY KEY,
    data_compra DATE NOT NULL,
    cliente_id VARCHAR(11) NOT NULL,
    valor_total DECIMAL (13, 2) NOT NULL,
    usuario_resp  VARCHAR(100) NOT NULL,
    
    FOREIGN KEY (cliente_id) REFERENCES clientes(cpf),
    FOREIGN KEY (usuario_resp) REFERENCES usuarios(username)
);

CREATE TABLE itens_venda(
	id INT AUTO_INCREMENT PRIMARY KEY,
	venda_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unit DECIMAL(13, 2) NOT NULL,
    subtotal DECIMAL(13, 2) NOT NULL,
    
    FOREIGN KEY (venda_id) REFERENCES vendas(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id),
    
    CONSTRAINT ck_itens_venda_quantidade01 CHECK ( quantidade > 0),
    CONSTRAINT ck_itens_venda_preco_unit01 CHECK (preco_unit >= 0),
    CONSTRAINT ck_itens_venda_subtotal01 CHECK (subtotal >= 0)
);

SELECT* FROM usuarios;
SELECT* FROM clientes;
SELECT* FROM produtos;
SELECT* FROM vendas;
SELECT* FROM itens_venda;