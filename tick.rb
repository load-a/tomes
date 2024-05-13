def tick(args)

  DevTools::update(args) 
  Keyboard::update(args)
  args.state.ob ||= Keyboard

  args.state.ls = [
    args.state.ob,
    Keyboard::letter_hold
  ]

  DevTools.list([100, 700], Keyboard.instance_methods.sort - Object.instance_methods)
  DevTools.list([500, 700], args.state.ls)
end
