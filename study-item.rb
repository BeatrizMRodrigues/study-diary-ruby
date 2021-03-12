class StudyItem
  attr_reader :id, :title, :category

  @@next_id = 1
  @@study_items = []

  def initialize(title:, category:)
    @id = @@next_id
    @title = title
    @category = category

    @@next_id += 1
    @@study_items << self
  end

  def include?(query)
    title.downcase.include?(query.downcase) || category.downcase.include?(query.downcase)
  end

  def to_s
    "##{id} - #{title} - #{category}"
  end

  def self.register
    print 'Digite o título do seu item de estudo: '
    title = gets.chomp
    print 'Digite a categoria do seu item de estudo: '
    category = gets.chomp
    puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"
    new(title: title, category: category)
  end

  def self.all
    @@study_items
  end

  def self.print_items
    puts StudyItem.all
    puts 'Nenhum item encontrado' if StudyItem.all.empty?
  end

  def self.search
      print 'Digite uma palavra para procurar: '
      term = gets.chomp
      found = StudyItem.all.filter do |item|
      item.include?(term)
    end
    puts found
  end

  def self.delete
    puts '==== Lista de itens ===='
    print_items
    puts 'Qual item de estudos você quer apagar? '
    id = gets.to_i
    study_item = StudyItem.all.detect do |study_item|
      study_item.id == id
    end
    StudyItem.all.delete(study_item)
  end

end
