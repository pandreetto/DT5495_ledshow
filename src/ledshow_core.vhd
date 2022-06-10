library ieee;
use IEEE.Std_Logic_1164.all;

entity ledshow_core is
port(
    clock : in  std_logic;
    led_reg : out std_logic_vector(7 downto 0)
);
end ledshow_core;

architecture rtl of ledshow_core is
    type ldirection is (sx, dx);
    signal main_reg : std_logic_vector(7 downto 0) := "00000001";
begin
    led_reg <= main_reg;

    ctrl_proc : process(clock)
        variable led_dir : ldirection := sx;
    begin
        if rising_edge(clock) then

            if main_reg(0) = '1' then
                led_dir := sx;
                main_reg(0) <= '0';
                main_reg(1) <= '1';
            end if;

            for idx in 1 to 6 loop
                if main_reg(idx) = '1' then
                    led_dir := dx;
                    main_reg(idx) <= '0';
                    if led_dir = sx then
                        main_reg(idx + 1) <= '1';
                    else
                        main_reg(idx - 1) <= '1';
                    end if;
                end if;
            end loop;

            if main_reg(7) = '1' then
                led_dir := dx;
                main_reg(6) <= '1';
                main_reg(7) <= '0';
            end if;

        end if;
    end process ctrl_proc;
end rtl;
