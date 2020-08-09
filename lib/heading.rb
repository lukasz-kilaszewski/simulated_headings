class Heading
  def initialize(props)
    @props = props
  end

  def simulated_headings
    #get maximum heading level and prepare auxiliary variable for numbering before heading name
    max_heading = (@props.map { |x| x[:heading_level] }).max
    #will count the number of times we add each heading with a level
    @numbering = Array.new(max_heading + 1, 0)

    headings = ''

    @props.each do |item|
      #increase the counter at a given heading level
      @numbering[item[:heading_level]] += 1
      
      tabs = "\t" * item[:heading_level]
      
      #prepare a properly formatted heading for output
      headings +=
        "#{tabs} #{get_numbering(item)} #{item[:title].capitalize()} \n"
    end
    headings
  end

  private

  def get_numbering(item)
    title_numbering = ''
    
    #generate heading title numbering
    (item[:heading_level] + 1).times do |i|
      title_numbering += "#{@numbering[i] == 0 ? 1 : @numbering[i]}."
    end
    title_numbering 
  end
end
