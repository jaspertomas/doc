class Topic < ActiveRecord::Base
  attr_accessible :name, :parent_id
  validate :name, :presence=> true
  has_many :posts
  belongs_to :parent, :class_name => "Topic", :foreign_key => 'parent_id'
  has_many :children, :class_name => "Topic", :foreign_key => 'parent_id'

  def is_root?
    self.parent_id==nil || self.parent_id==0
  end  
  
  def to_s
    self.name
  end


  def lineagehash
    lineage={}
    topic=self
    
    begin
      lineage[topic.type_id.to_sym]=topic
      topic = topic.parent
    end while not topic.nil?  
      
    lineage
  end
  def lineage
    lineage=[]
    topic=self
    
    begin
      lineage << topic
      topic = topic.parent
    end while not topic.nil?  
      
    lineage.reverse  
  end
  
  def lineage_ids
    array=[]
    self.lineage.each do |ancestor|
       array << ancestor.id
    end
    return array
  end  
  
  def ancestors
    if parent
      parent.lineage
    else
      []
    end
  end  
  def ancestors_ids
    array=[]
    if parent
      parent.lineage.each do |ancestor|
         array << ancestor.id
      end
    end
    return array
  end  
  
end
