# -*- coding: utf-8 -*-

require 'nkf'

Plugin.create(:hankaku_kana) do
  command(:hankaku_kana,
          name: '半角ｶﾅ',
          condition: lambda{ |opt| true },
          visible: true,
          role: :postbox
          ) do |opt|
    message = Plugin[:gtk].widgetof(opt.widget).widget_post.buffer.text
    message = NKF.nkf('-w -Z4', message)

    Plugin[:gtk].widgetof(opt.widget).widget_post.buffer.text = message
  end

end
