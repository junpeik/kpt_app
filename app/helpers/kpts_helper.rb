module KptsHelper

  #created_atの表記をわかりやすくする。
  def simple_time(time)
    time.strftime("%Y-%m-%d %H:%M %a")
  end
end
