# じゃんけん＆あっち向いてホイゲーム

def janken
  puts "じゃんけんをしましょう！ (0: グー, 1: チョキ, 2: パー, 3: 戦わない)"
  
  player_choice = nil
  until [0, 1, 2, 3].include?(player_choice)
    print "じゃんけん......: "
    player_choice = gets.chomp.to_i
    puts "0〜3の数字を入力してください。" unless [0, 1, 2, 3].include?(player_choice)
  end

  # 「戦わない」を選択した場合、ゲーム終了
  if player_choice == 3
    puts "ゲームを終了します。"
    exit
  end

  hands = ["グー", "チョキ", "パー"]
  cpu_choice = rand(3) # 相手はランダムでグー・チョキ・パーを出す
  
  puts "あなた: #{hands[player_choice]}"
  puts "相手: #{hands[cpu_choice]}"

  if player_choice == cpu_choice
    puts "あいこです！もう一度。"
    return janken
  elsif (player_choice == 0 && cpu_choice == 1) || (player_choice == 1 && cpu_choice == 2) || (player_choice == 2 && cpu_choice == 0)
    puts "あなたの勝ち！ あっち向いてホイへ進みます。"
    return "win"
  else
    puts "あなたの負け！ あっち向いてホイへ進みます。"
    return "lose"
  end
end

def acchimuite
  directions = ["上", "下", "左", "右"]

  puts "あっち向いてホイ！ (0: 上, 1: 下, 2: 左, 3: 右)"
  
  player_direction = nil
  until [0, 1, 2, 3].include?(player_direction)
    print "指を差す方向を選んでください: "
    player_direction = gets.chomp.to_i
    puts "0〜3の数字を入力してください。" unless [0, 1, 2, 3].include?(player_direction)
  end

  cpu_direction = rand(4)

  puts "あなた: #{directions[player_direction]}"
  puts "相手: #{directions[cpu_direction]}"

  if player_direction == cpu_direction
    puts "勝負あり！ ゲーム終了 🎉"
    return true
  else
    puts "勝負がつきませんでした。もう一度じゃんけんへ戻ります！"
    return false
  end
end

# ゲーム開始
loop do
  result = janken
  break if result.nil? # じゃんけんがあいこなら再挑戦

  break if result == "win" && acchimuite
  break if result == "lose" && acchimuite
end