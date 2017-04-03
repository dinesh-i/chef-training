windows_service '7zip' do
  action [:configure_startup, :enable, :start]
end
