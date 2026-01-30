
CREATE TABLE [dbo].[Cliente](
[idCliente] [int] IDENTITY(1,1) NOT NULL,
[razonSocial] [nvarchar](50) NULL,
[idTipoCliente] [int] NULL,
[fecRegCliente] [date] NULL,
[IdCiudad] [int] NOT NULL,
[estCliente] [bit] NULL,
CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED
(
[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS =
ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
CREATE PROCEDURE [dbo].[spListarCliente]
AS
SELECT idCliente, razonSocial, idTipoCliente, fecRegCliente, idCiudad, estCliente
from Cliente
where estCliente='1'





CREATE PROCEDURE [dbo].[spInsertarCliente]
(@razonSocial varchar(50),
@idTipoCliente int,
@fecRegCliente date,
@idCiudad int,
@estCliente bit
)
as
begin
insert into Cliente(razonSocial,idTipoCliente,fecRegCliente, idCiudad, estCliente) values
(@razonSocial, @idTipoCliente,@fecRegCliente,@idCiudad, @estCliente)
end
create or alter PROCEDURE [dbo].[spEditarCliente]
(@idCliente int,
@razonSocial varchar(50),
@idTipoCliente int,
@fecRegCliente date,
@idCiudad int,
@estCliente bit
)
as
begin
update Cliente set
razonSocial = @razonSocial,
idTipoCliente = @idTipoCliente,
idCiudad =@idCiudad,
fecRegCliente = @fecRegCliente,
estCliente = @estCliente
where idCliente = @idCliente
end
create or alter PROCEDURE [dbo].[spDeshabilitarCliente]
(@idCliente int)
as
begin
update Cliente set
estCliente = 0
where idCliente = @idCliente
end
