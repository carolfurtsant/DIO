using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace cursoMVC.Models
{
    public class Context : DbContext
    {
        public DbSet<Categoria> Categorias { get; set; }
        public DbSet<Produto> Produtos { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(connectionString : @"Server=localhost\SQLEXPRESS;Database=cursoMVC;Trusted_Connection=True");
        }

        public void SetModified(Categoria categoria)
        {
            throw new NotImplementedException();
        }

        public void SetModified(Produto produto)
        {
            throw new NotImplementedException();
        }
    }
}
