
create database Ecommerce_DIO

use Ecommerce_DIO

create table Clientes
(
	Codigo int not null,
	Nome varchar(50) not null,
	TipoPessoa char(1) not null
)

create table Produtos
(
	Codigo int not null,
	Nome varchar (100) not null,
	Descricao varchar (200) not null,
	Preco float not null
)

create table Pedido
(
	Codigo int not null,
	DataSolicitacao datetime not null,
	FlagPago bit not null,
	TotalPedido float not null,
	CodigoCliente int not null
)

create table PedidoItem
(
	CodigoPedido int not null,
	CodigoProduto int not null,
	Preco float not null,
	Quantidade int not null
)

select * from Clientes

insert into clientes(Codigo, Nome, TipoPessoa) values (1, 'Ana', 'F');
insert clientes(Nome, Codigo, TipoPessoa) values ('Gabriel', 2, 'F');
insert clientes(TipoPessoa, Nome, Codigo) values ('J', 'Adeildo', 3);
insert clientes values (4, 'Juliana', 'J');
insert clientes values (5, 'Tatiana', 'F'), (6, 'Laiz', 'J'), (7, 'Enock', 'J'), (8, 'Eduardo', 'F')

delete from Clientes where Codigo in(5, 4, 3)

select * from Produtos

insert Produtos values(1, 'Caneta', 'Caneta Azul', 1.50)
insert Produtos values(2, 'Caderno', 'Caderno de 10 matérias', 20.99)

select * from Pedido

insert Pedido values (1, getdate(), 0, 3, 7)
insert Pedido values (2, getdate(), 0, 22.49, 1)

select * from PedidoItem

insert PedidoItem values(2, 1, 1.5, 1)
insert PedidoItem values(2, 2, 20.99, 1)

select * from Clientes

insert Clientes(Codigo, Nome, TipoPessoa) values(9, 'Valéria', 'J')

select isnull(DataCriacao, getdate()), * 
from Clientes

select *,
		case
			when TipoPessoa = 'J' then 'Juridica'
			when TipoPessoa = 'F' then 'Fisica'
			else 'Pessoa Indefinida'
		end + convert(varchar, getdate(), 103)
from Clientes

select *, convert(varchar, DataSolicitacao, 103)
from Pedido

select * from	Clientes

alter table Clientes add constraint pk_Cliente primary key(Codigo)

insert Clientes values('Diego', 'J', getdate())

select * from PedidoItem

alter table PedidoItem add constraint fk_Pedido foreign key(CodigoPedido) references Pedido(Codigo)

select * from Pedido
select * from PedidoItem
select * from Produtos
select * from Clientes

select * from Telefones

Id CodigoCliente DDD Telefone

alter table Pedido add CodigoStatus int
alter table Pedido add DescStatus varchar(50)

update Pedido set CodigoStatus = 1, DescStatus = 'Em Andamento'

Select * from Status

Select * from StatusPedidoItem

insert PedidoItemLog (CodigoPedido, CodigoProduto, CodigoStatusPedidoItem, DataMovimento)
select CodigoPedido, CodigoProduto, 1, getdate()
from PedidoItem

Select * From PedidoItemLog
insert PedidoItemLog values(1, 2, 1, getdate())

inner join
left join
right join

select	*
from	Clientes cli
inner	join Pedido ped
on		cli.Codigo = ped.CodigoCliente

select	*
from	Clientes cli
left	join Pedido ped
on		cli.Codigo = ped.CodigoCliente

select	*
from	Pedido ped
right	join Clientes cli
on		cli.Codigo = ped.CodigoCliente

select	cli.Nome,
		ped.TotalPedido,
		case
			when cli.TipoPessoa = 'F' then 'Fisica'
			else 'Juridica'
		end TipoPessoa
from	Clientes cli
left	join Pedido ped
on		cli.Codigo = ped.CodigoCliente

select	*
from	PedidoItem t1
inner	join PedidoItemLog t2
on		t1.CodigoPedido = t2.CodigoPedido
and		t1.CodigoProduto = t2.CodigoProduto
inner	join StatusPedidoItem t3
on		t3.Codigo = t2.CodigoStatusPedidoItem
where	Preco between 1 and 2

select	sum(Preco * Quantidade) 
from	PedidoItem t1
inner	join PedidoItemLog t2
on		t1.CodigoPedido = t2.CodigoPedido
and		t1.CodigoProduto = t2.CodigoProduto
inner	join StatusPedidoItem t3
on		t3.Codigo = t2.CodigoStatusPedidoItem

select	avg(Preco) 
from	PedidoItem t1
inner	join PedidoItemLog t2
on		t1.CodigoPedido = t2.CodigoPedido
and		t1.CodigoProduto = t2.CodigoProduto
inner	join StatusPedidoItem t3
on		t3.Codigo = t2.CodigoStatusPedidoItem

select	count(*) 
from	PedidoItem t1
inner	join PedidoItemLog t2
on		t1.CodigoPedido = t2.CodigoPedido
and		t1.CodigoProduto = t2.CodigoProduto
inner	join StatusPedidoItem t3
on		t3.Codigo = t2.CodigoStatusPedidoItem

select	* 
from	PedidoItem t1
inner	join PedidoItemLog t2
on		t1.CodigoPedido = t2.CodigoPedido
and		t1.CodigoProduto = t2.CodigoProduto
inner	join StatusPedidoItem t3
on		t3.Codigo = t2.CodigoStatusPedidoItem
inner	join Produtos t4
on		t4.Codigo = t2.CodigoProduto

select	t4.Codigo,
		t4.Descricao,
		t1.Preco * t1.Quantidade
from	PedidoItem t1
inner	join PedidoItemLog t2
on		t1.CodigoPedido = t2.CodigoPedido
and		t1.CodigoProduto = t2.CodigoProduto
inner	join StatusPedidoItem t3
on		t3.Codigo = t2.CodigoStatusPedidoItem
inner	join Produtos t4
on		t4.Codigo = t2.CodigoProduto

select	t4.Codigo,
		t4.Descricao,
		sum(t1.Preco * t1.Quantidade) 
from	PedidoItem t1
inner	join PedidoItemLog t2
on		t1.CodigoPedido = t2.CodigoPedido
and		t1.CodigoProduto = t2.CodigoProduto
inner	join StatusPedidoItem t3
on		t3.Codigo = t2.CodigoStatusPedidoItem
inner	join Produtos t4
on		t4.Codigo = t2.CodigoProduto

group	by t4.Codigo,
		t4.Descricao

Order	by 3 desc

