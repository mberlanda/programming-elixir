result = with {:ok, file}    = File.open("/etc/passwd"),
          content        = IO.read(file, :all),
          :ok            = File.close(file),
          # This will not raise for unmatched patterns
          [_, uid, guid] <- Regex.run(~r{^xxx:.*?:(\d+):(\d+)}m, content) 
    do
       "Group: #{guid}, User: #{uid}"
    end

IO.puts inspect(result)
