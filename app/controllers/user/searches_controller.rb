class User::SearchesController < User::Base
  def index
  	@sel = params[:sel].to_i
    @keyword = params[:keyword]
  	if @sel == 1
  		#アーティスト
      array = []
  		artists = Artist.where('name LIKE ?', "%#{params[:keyword]}%")
      artists.each do |art|
        tr = TrackRelation.where(artist_id: art.id)
        tr.each do |t|
          array << {id: t.song.id, name: t.song.name}
        end
      end
      @res = array.uniq
  	elsif @sel == 2
  		#曲名
   		@res = Song.where('name LIKE ?', "%#{params[:keyword]}%")
  	elsif @sel == 3
  		#商品名
      array = []
  		products = Product.where('name LIKE ?', "%#{params[:keyword]}%")
      products.each do |pro|
        pro.discs.each do |d|
          d.track_relations.each do |tr|
              array << {id: tr.song.id, name: tr.song.name}
          end
        end
      end
      @res = array.uniq
  	else
  		redirect_to root_path
  	end
  end

  def create
  	#パラメータからクエリパラメータを含むurlを生成する。
  	arg = {sel: params[:sel], keyword: params[:keyword]}
	redirect_to "/searches?#{arg.to_query}"
  end
end
