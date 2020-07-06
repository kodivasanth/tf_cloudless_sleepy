# Create an arbitrary local resource
data "template_file" "test" {
  template = "Hello, I am a template. My sample_var value = $${sample_var}"

  vars {
    sample_var = "${var.sample_var}"
  }
}

provisioner "local-exec" {
    command = "ping localhost -c 100"
  }
}
