
  
  desc "import data"
  task import: [:environment] do

    file = "vendor/assets/data/merchants.csv"
    CSV.foreach(file, :headers => true) do |row|
      Merchant.create!(row.to_h)
    end

    file = "vendor/assets/data/customers.csv"
    CSV.foreach(file, :headers => true) do |row|
      Customer.create!(row.to_h)
    end

    file = "vendor/assets/data/invoices.csv"
    CSV.foreach(file, :headers => true) do |row|
      Invoice.create!(row.to_h)
    end

    file = "vendor/assets/data/items.csv"
    CSV.foreach(file, :headers => true) do |row|
      row["unit_price"] = row["unit_price"].to_f/100
      Item.create!(row.to_h)
    end

    file = "vendor/assets/data/invoice_items.csv"
    CSV.foreach(file, :headers => true) do |row|
      row["unit_price"] = row["unit_price"].to_f/100
      InvoiceItem.create!(row.to_h)
    end

    file = "vendor/assets/data/transactions.csv"
    CSV.foreach(file, :headers => true) do |row|
      Transaction.create!(row.to_h)
    end
  end