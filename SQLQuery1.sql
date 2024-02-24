use [P419]


-- TABLES --

create table [dbo].[Sizes](
  [Id] int primary key identity(1,1) not null,
  [Name] nvarchar(100) not null,
  [SmallName] varchar(10) not null,
  [CreatedAt] datetime not null default getdate(),
  [CreatedBy] int not null,
  [LastModifiedAt] datetime,
  [LastModifiedBy] int,
  [DeletedBy] datetime,
  [DeletedAt] int


)
create table [dbo].[Colors](
  [Id] int primary key identity(1,1) not null,
  [Name] nvarchar(100) not null,
  [HexCode] varchar(100) not null,
  [CreatedAt] datetime not null default getdate(),
  [CreatedBy] int not null,
  [LastModifiedAt] datetime,
  [LastModifiedBy] int,
  [DeletedBy] datetime,
  [DeletedAt] int


)
create table [dbo].[Brands](
  [Id] int primary key identity(1,1) not null,
  [Name] nvarchar(100) not null,
  [CreatedAt] datetime not null default getdate(),
  [CreatedBy] int not null,
  [LastModifiedAt] datetime,
  [LastModifiedBy] int,
  [DeletedBy] datetime,
  [DeletedAt] int
)
create table [dbo].[Products](
  [Id] int primary key identity(1,1) not null,
  [Name] nvarchar(100) not null,
  [Slug] varchar(100) not null,
  [StockKeepingUnit] nvarchar(100) not null,
  [ShortDescription] nvarchar(100) not null,
  [Description] nvarchar(100) not null,
  [Rate] float not null,
  [CategoryId] int not null,
  [BrandId] int,
  [CreatedAt] datetime not null default getdate(),
  [CreatedBy] int not null,
  [LastModifiedAt] datetime,
  [LastModifiedBy] int,
  [DeletedBy] datetime,
  [DeletedAt] int

  
)
create table [dbo].[SpecificationValues](
    [ProductId] int identity(1,1) not null,
	[SpecificationId] int not null,
	[Values] nvarchar(150),
	
)
alter table [dbo].[SpecificationValues]
ADD CONSTRAINT PK_SpecificationValues PRIMARY KEY([ProductId],[SpecificationId])
create table [dbo].[ProductImages](
    [Id] int primary key identity(1,1) not null,
	[Name] nvarchar(100) not null,
	[IsMain] bit not null,
	[ProductId] int,
)
create table [dbo].[Categories](
  [Id] int primary key identity(1,1) not null,
  [ParentId] int,
  [Name] nvarchar(100) not null,
  [CreatedAt] datetime not null default getdate(),
  [CreatedBy] int not null,
  [LastModifiedAt] datetime,
  [LastModifiedBy] int,
  [DeletedBy] datetime,
  [DeletedAt] int

  
)
create table [dbo].[Specifications](
  [Id] int primary key identity(1,1) not null,
  [Name] nvarchar(100) not null,
  [CreatedAt] datetime not null default getdate(),
  [CreatedBy] int not null,
  [LastModifiedAt] datetime,
  [LastModifiedBy] int,
  [DeletedBy] datetime,
  [DeletedAt] int

  
)
create table [dbo].[BlogPosts](
  [Id] int primary key identity(1,1) not null,
  [Title] nvarchar(100) not null,
  [Slug] nvarchar(100) not null,
  [Body] nvarchar(100) not null,
  [ImagePath] nvarchar(100) not null,
  [CategoryId] int not null,
  [PublishedBy] datetime,
  [PublishedAt] datetime,
  [CreatedAt] datetime not null default getdate(),
  [CreatedBy] int not null,
  [LastModifiedAt] datetime,
  [LastModifiedBy] int,
  [DeletedBy] datetime,
  [DeletedAt] int
)

-- ALTERS AND FOREIGN KEYS -- 

alter table [dbo].[Products]
ADD CONSTRAINT FK_Products_Categories FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories](Id) 

alter table [dbo].[Products]
ADD CONSTRAINT FK_Products_Brands FOREIGN KEY ([BrandId]) REFERENCES [dbo].[Brands](Id)

alter table [dbo].[SpecificationValues]
ADD CONSTRAINT FK_SpecificationValues_Products FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products](Id)

alter table [dbo].[SpecificationValues]
ADD CONSTRAINT FK_SpecificationValues_Specifications FOREIGN KEY ([SpecificationId]) REFERENCES [dbo].[Specifications](Id)

alter table [dbo].[ProductImages]
ADD CONSTRAINT FL_ProductImages_Products FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products](Id)

alter table [dbo].[Categories]
ADD CONSTRAINT FK_Categories_Categories FOREIGN KEY ([ParentId]) REFERENCES [dbo].[Categories]([Id])

alter table [dbo].[BlogPosts]
ADD CONSTRAINT FK_BlogPosts_Categories FOREIGN KEY (CategoryId) REFERENCES [dbo].[Categories]([Id])
