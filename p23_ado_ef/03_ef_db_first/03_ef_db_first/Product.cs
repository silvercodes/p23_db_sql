﻿namespace _03_ef_db_first;

internal class Product
{
    public int Id { get; set; }
    public string Title { get; set; }
    public string Description { get; set; }
    public double Price { get; set; }

    public override string ToString()
    {
        return $"id: {Id}, title: {Title}, description: {Description}, price: {Price}";
    }
}
